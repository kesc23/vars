import gleam/result
import gleam/io
import argv
import envoy
import vars/internal.{format_pair}

pub fn main() {
  case argv.load().arguments {
    ["get", name] -> get( name )
    _ -> io.println( "Usage: vars get <name>" )
  }
}

fn get( name: String ) -> Nil {
  envoy.get( name )
    |> result.unwrap("")
    |> format_pair(name, _)
    |> io.println
}