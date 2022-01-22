module Styles = {
  open Emotion
  let container = css({
    "display": "flex",
    "justifyContent": "center",
    "gap": "var(--s-1)",
    "marginBottom": "var(--s-1)",
  })
  let link = css({
    "color": "cornflowerblue",
    "fontWeight": 700,
  })
}

let svgKo =
  <SVGIconKo
    style={ReactDOM.Style.make(~overflow="visible", ~display="block", ())}
    fill="indianred"
    height="1em"
    width="1em"
  />

let svgOk =
  <SVGIconOk
    style={ReactDOM.Style.make(~overflow="visible", ~display="block", ())}
    fill="yellowgreen"
    height="1em"
    width="1em"
  />

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
    <a href="{baseUrl->React.string}" className={Styles.link}> {baseUrl->React.string} </a>
    {switch results {
    | NotAsked => React.null
    | Loading => <LoadingIndicator />
    | Done(Error(_)) => svgKo
    | Done(Ok({ok})) => ok ? svgOk : svgKo
    }}
  </div>
}
