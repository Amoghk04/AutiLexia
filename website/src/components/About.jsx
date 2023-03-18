import Logo from '../assets/logo.png'
import { useEffect, useRef } from 'react';
import { motion, useAnimation, useInView } from "framer-motion";
import '../css/About.css'

const About = () => {
    return (
        <>
            <div className="about__container">
                <h1 className="about__title">Neucare</h1>
                <p className="about__tagline body-light-black">...one step at a time, you got this!</p>
                <motion.div className="about__card" whileInView={{ x: [-100, -90, -80, -70, -60, -50, -40, -30, -20, -10, 0] }}>
                    <img className="" src={Logo} alt="Logo" />
                    <div className="about__card-description">
                        <h1 className="heading-black text-underline">About</h1>
                        <ul className="about__card-list">
                            <li className="body-light-black">Neucare is an app that is developed by four students of Ramaiah Institute of Technology.</li>
                            <li className="body-light-black">It is designed to help students with autism and dyslexia learn more effectively through the use of games and interactive content.</li>
                            <li className="body-light-black">You can learn more about our app and its features by exploring our website.</li>
                        </ul>
                    </div>
                </motion.div>
                <h2 className="heading-black">Download from the Play Store and the App Store!</h2>
                <a href="#">Play Store</a>
                <a href="#">App Store</a>
            </div>
        </>
    )
}
export default About;