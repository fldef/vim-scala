object Main {
5 match {
case 5 => ()
case 6 => {}
case 7 => {
}
case 8 => {
9 match {
// comment
case 10 => ()
case foo =>
foobar
{}
foobar
case 11 => {}
case 12 => {
}
case bar =>
foobar
13 match {
case foo => ()
}
}
}

case 13 => ()
}
}

