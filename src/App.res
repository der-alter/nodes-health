Emotion.injectGlobal(`
:root {
  --ratio: 1.61803398875;
  --s-5: calc(var(--s-4) / var(--ratio));
  --s-4: calc(var(--s-3) / var(--ratio));
  --s-3: calc(var(--s-2) / var(--ratio));
  --s-2: calc(var(--s-1) / var(--ratio));
  --s-1: calc(var(--s0) / var(--ratio));
  --s0: 1rem;
  --s1: calc(var(--s0) * var(--ratio));
  --s2: calc(var(--s1) * var(--ratio));
  --s3: calc(var(--s2) * var(--ratio));
  --s4: calc(var(--s3) * var(--ratio));
  --s5: calc(var(--s4) * var(--ratio));
}
* {
  box-sizing: border-box;
}
html {
  padding: 0;
  margin: 0;
  height: -webkit-fill-available;
  font-family: sans-serif;
}
body {
  padding: 0;
  margin: 0;
  background-color: #333;
}
ul {
  margin: 0 auto;
  max-width: 50%;
  list-style: none;
  font-size: var(--s0);
}`)

let nodes = [
  "http://localhost:20000",
  "https://mainnet.smartpy.io",
  "https://ghostnet.smartpy.io",
  "https://rpc.ghostnet.teztnets.xyz",
  "https://mainnet.api.tez.ie",
  "https://rpc.tzbeta.net",
  "https://ghostnet.ecadinfra.com",
]

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
