open ReactTest

testWithReact("Header renders", container => {
  act(() => ReactDOM.render(<Header />, container))

  Assert.elementContains(~message="Renders title", container, "Tezos Nodes Health Check")
})
