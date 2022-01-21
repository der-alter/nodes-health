module Styles = {
  open Emotion

  let loader = css({
    "border": "5px solid #ffedac",
    "borderTop": "5px solid darkorange",
    "borderRadius": "50%",
    "width": "2ex",
    "height": "2ex",
  })

  let spin = keyframes({
    "0%": {
      "transform": "rotate(0deg)",
    },
    "100%": {
      "transform": "rotate(360deg)",
    },
  })
}

@react.component
let make = () => {
  <div
    className={Styles.loader}
    style={ReactDOM.Style.make(~animation=Styles.spin ++ " 0.5s linear infinite", ())}
  />
}
