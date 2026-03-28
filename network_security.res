// ReScript network security types
type department =
  | MGMT | FINANCE | IT | RND | MARKET | GUEST

type firewallRule = {
  source: department,
  destination: department,
  allowed: bool
}

let rules = [
  {source: GUEST, destination: MGMT, allowed: false},
  {source: RND, destination: INTERNET, allowed: false},
  {source: IT, destination: ALL, allowed: true}
]

let evaluateRule = (rule: firewallRule) => {
  Js.log2("Rule from ", rule.source)
}