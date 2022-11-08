type error =
  | Empty
  | NetworkError
  | Timeout

let mapError = error => {
  switch error {
  | #NetworkRequestFailed => NetworkError
  | #Timeout => Timeout
  }
}

module Styles = {
  open Emotion
  let container = css({
    "cursor": "pointer",
    "display": "flex",
    "padding": "var(--s-1)",
    "paddingBottom": "var(--s-5)",
  })
  let link = css({
    "color": "DodgerBlue",
    "fontWeight": 500,
    "flex": "1 1 auto",
    "textDecoration": "none",
    "&:hover": {
      "color": "CornflowerBlue",
    },
  })
  let error = css({
    "color": "indianred",
    "paddingLeft": "var(--s-1)",
  })
  let success = css({
    "color": "yellowgreen",
    "paddingLeft": "var(--s-1)",
  })
}

let svgKo = error => {
  <>
    <SVGIconKo
      style={ReactDOM.Style.make(~overflow="visible", ~display="block", ())}
      fill="indianred"
      height="1em"
      width="1em"
    />
    <span className={Styles.error}>
      {switch error {
      | NetworkError => "NetworkError"->React.string
      | Timeout => "Timeout"->React.string
      | Empty => "Error"->React.string
      }}
    </span>
  </>
}

let svgOk = (response, status) => {
  /* let {synced} = response */

  <>
    <SVGIconOk
      style={ReactDOM.Style.make(~overflow="visible", ~display="block", ())}
      fill="yellowgreen"
      height="1em"
      width="1em"
    />
    <span className={Styles.success}> {React.string(Js.Int.toString(status))} </span>
  </>
}

@react.component
let make = (~baseUrl) => {
  let (results, setResults) = React.useState(() => AsyncData.NotAsked)

  React.useEffect0(() => {
    setResults(_ => Loading)
    let _ =
      Request.make(
        ~url=`${baseUrl}/monitor/bootstrapped`,
        ~responseType=Json,
        (),
      )->Future.get(payload => setResults(_ => Done(payload)))
    None
  })

  <div className={Styles.container}>
    <a href={baseUrl} className={Styles.link}> {baseUrl->React.string} </a>
    {switch results {
    | NotAsked => React.null
    | Loading => <LoadingIndicator />
    | Done(Error(err)) => svgKo(mapError(err))
    | Done(Ok({ok, response, status})) => ok ? svgOk(response, status) : svgKo(Empty)
    }}
  </div>
}
