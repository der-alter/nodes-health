module Styles = {
  open Emotion
  let container = css({
    "display": "flex",
    "margin": "4ex auto",
    "width": "100%",
    "justifyContent": "center",
    "marginBottom": "5ex",
  })
  let title = css({
    "color": "floralwhite",
    "fontSize": "1.2em",
    "fontWeight": 500,
  })
}

@react.component
let make = () => {
  <header className=Styles.container>
    <h1 className=Styles.title> {"Tezos Nodes Health Check"->React.string} </h1>
  </header>
}
