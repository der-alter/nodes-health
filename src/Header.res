module Styles = {
  open Emotion
  let container = css({
    "display": "flex",
    "margin": "var(--s1) auto",
    "marginBottom": "var(--s2)",
    "justifyContent": "center",
  })
  let title = css({
    "color": "floralwhite",
    "fontSize": "var(--s1)",
    "fontWeight": 500,
  })
}

@react.component
let make = () => {
  <header className=Styles.container>
    <h1 className=Styles.title> {"Tezos Nodes Health Check"->React.string} </h1>
  </header>
}
