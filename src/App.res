Emotion.injectGlobal(`
html {
  padding: 0;
  margin: 0;
  height: -webkit-fill-available;
  font-family: sans-serif;
  box-sizing: border-box;
}
body {
  padding: 0; 
  margin: 0;
  color: royalblue;
  background-color: darkslategray;
}
ul {
  list-style: none;
}
#root {
}`)

let nodes = [
  /* "http://localhost:20000", */
  "https://rpc.tzstats.com",
  "https://mainnet.smartpy.io",
  "https://hangzhounet.smartpy.io",
  "https://mainnet.api.tez.ie",
  "https://hangzhounet.api.tez.ie",
  "https://testnet.pezos.fi",
  "https://mainnet.pezos.fi",
]

module App = {
  @react.component
  let make = () => {
    <>
      <Header />
      <ul>
        {React.array(
          Belt.Array.mapWithIndex(nodes, (i, baseUrl) =>
            <li key={Belt.Int.toString(i)}> <Node baseUrl /> </li>
          ),
        )}
      </ul>
    </>
  }
}

switch ReactDOM.querySelector("#root") {
| Some(root) => ReactDOM.render(<App />, root)
| None => Console.error("Missing #root element")
}
