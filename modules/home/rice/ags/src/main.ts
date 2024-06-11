import { applauncher } from "./launcher/applauncer"
import { returnBars } from "./bar/bar"
import { NotificationPopups } from "./notifications/notificationPopups"

const scss = `${App.configDir}/style.scss`
const css = `/tmp/my-style.css`

// Utils.timeout(100, () => Utils.notify({
//     summary: "Notification Popup Example",
//     iconName: "info-symbolic",
//     body: "Lorem ipsum dolor sit amet, qui minim labore adipisicing "
//         + "minim sint cillum sint consectetur cupidatat.",
//     actions: {
//         "Cool": () => print("pressed Cool"),
//     },
// }))
Utils.exec(`sassc ${scss} ${css}`)


App.config({
    style: css,

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
