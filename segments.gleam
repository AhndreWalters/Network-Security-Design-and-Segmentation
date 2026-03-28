import gleam/io
import gleam/string

pub fn main() {
  // VLAN assignments: department -> VLAN ID
  [
    #("MGMT", 10),
    #("FINANCE", 20),
    #("MARKET", 30),
    #("IT", 40),
    #("RND", 50),
    #("GUEST", 60),
  ]
  |> list.each(fn(dept, id) {
    io.println(dept <> " -> VLAN " <> string.to_int(id))
  })
}