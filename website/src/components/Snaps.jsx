import { motion } from "framer-motion"
import App1 from "../assets/app_pic1.jpg"
import App2 from "../assets/app_pic2.jpg"
import App3 from "../assets/app_pic3.jpg"
import App4 from "../assets/app_pic4.jpg"
import "../css/Snaps.css"


const Snaps = () => {

    return <>
        <div className="snaps__container">
            <h1 className="snaps__title">Some snapshots of the app</h1>
            <table className="snaps__table">
                <tr>
                    <td><motion.div whileInView={{ x: [-100, -95, -90, -85, -80, -75, -70, -65, -60, -55, -50, -45, -40, -35, -30, -25, -20, -15, -10, -5, 0], opacity: [0, 0.2, 0.4, 0.6, 0.8, 1] }}>
                        <img className="" src={App1} alt="Home Page" hspace="200" vspace="50" width="250" height="460"></img>
                    </motion.div></td>
                    <td><motion.div whileInView={{ x: [-100, -95, -90, -85, -80, -75, -70, -65, -60, -55, -50, -45, -40, -35, -30, -25, -20, -15, -10, -5, 0], opacity: [0, 0.2, 0.4, 0.6, 0.8, 1] }}>
                        <img className="" src={App2} alt="Profile Page" hspace="200" vspace="50" width="250" height="460"></img>
                    </motion.div></td>
                </tr>
                <tr>
                    <td><motion.div whileInView={{ x: [-100, -95, -90, -85, -80, -75, -70, -65, -60, -55, -50, -45, -40, -35, -30, -25, -20, -15, -10, -5, 0], opacity: [0, 0.2, 0.4, 0.6, 0.8, 1] }}>
                        <img className="" src={App3} alt="Game Page" hspace="200" vspace="50" width="250" height="460"></img>
                    </motion.div></td>
                    <td><motion.div whileInView={{ x: [-100, -95, -90, -85, -80, -75, -70, -65, -60, -55, -50, -45, -40, -35, -30, -25, -20, -15, -10, -5, 0], opacity: [0, 0.2, 0.4, 0.6, 0.8, 1] }}>
                        <img className="" src={App4} alt="Game Play" hspace="200" vspace="50" width="250" height="460"></img>
                    </motion.div></td>
                </tr>
            </table>
        </div>
    </>
}

export default Snaps
