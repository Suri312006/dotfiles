import { applauncher } from "./applauncer"
import { returnBars } from "./bar"
import { NotificationPopups } from "./notificationPopups"


// Utils.timeout(100, () => Utils.notify({
//     summary: "Notification Popup Example",
//     iconName: "info-symbolic",
//     body: "Lorem ipsum dolor sit amet, qui minim labore adipisicing "
//         + "minim sint cillum sint consectetur cupidatat.",
//     actions: {
//         "Cool": () => print("pressed Cool"),
//     },
// }))


App.config({
    style: "./style.css",

    windows: [
        returnBars(),
        applauncher,
        NotificationPopups()
        // you can call it, for each monitor
        // Bar(0),
        // Bar(1)
    ],
})

export { }
