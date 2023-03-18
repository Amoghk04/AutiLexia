import Logo from '../assets/logo.png'
import { animate, motion } from "framer-motion";
import '../css/About.css'

const About = () => {
    return (
        <motion.div className="main__card" initial={{ x: -100 }} animate={{ x: 0 }} transition={{ duration: 1.5 }}>
            <img className="" src={Logo} alt="Logo" />
            <div className="main__card-description">
                <h1 className="heading-black text-underline">About</h1>
                <ul className="main__card-list">
                    <li className="body-light-black">Neucare is an app that is developed by four students of Ramaiah Institute of Technology.</li>
                    <li className="body-light-black">It is designed to help students with autism and dyslexia learn more effectively through the use of games and interactive content.</li>
                    <li className="body-light-black">You can learn more about our app and its features by exploring our website.</li>
                </ul>
            </div>
        </motion.div>
    )
}
export default About;