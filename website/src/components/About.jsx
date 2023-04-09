import App1 from '../assets/app_pic1.jpg'
import App2 from '../assets/app_pic2.jpg'
import App3 from '../assets/app_pic3.jpg'
import App4 from '../assets/app_pic4.jpg'
import Logo from '../assets/logo.png'
import { motion } from "framer-motion";
import '../css/About.css'

const About = () => {
    return (
        <>
            <div className="about__container">
                <h1 className="about__title">Spectramind</h1>
                <p className="about__tagline body-light-black">...one step at a time, you got this!</p>
                <motion.div className="about__card" whileInView={{ x: [-100, -95, -90, -85, -80, -75, -70, -65, -60, -55, -50, -45, -40, -35, -30, -25, -20, -15, -10, -5, 0], opacity: [0, 0.2, 0.4, 0.6, 0.8, 1] }}>
                    <img className="" src={Logo} alt="Logo" />
                    <div className="about__card-description">
                        <h1 className="heading-black text-underline">About</h1>
                        <ul className="about__card-list">
                            <li className="body-light-black">Spectramind is an app that is developed by four students of Ramaiah Institute of Technology.</li>
                            <li className="body-light-black">It is designed to help students with autism and dyslexia learn more effectively through the use of games and interactive content.</li>
                            <li className="body-light-black">You can learn more about our app and its features by exploring our website.</li>
                        </ul>
                    </div>
                </motion.div>
                <h2 className="heading-black">Download from the Play Store and the App Store!</h2>
                <a href="#">Play Store</a>
                <a href="#">App Store</a>
	    	<br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br>
                <motion.div className="about__snapshots"  whileInView={{ x: [-100, -95, -90, -85, -80, -75, -70, -65, -60, -55, -50, -45, -40, -35, -30, -25, -20, -15, -10, -5, 0], opacity: [0, 0.2, 0.4, 0.6, 0.8, 1] }}>
                <h1>Some snapshots of the current app</h1>
                <img className="" src={App1} alt="Home Page" hspace="200" vspace="50" width="250" height="460"></img>
	    	<t></t>
	    	<img className="" src={App2} alt="Profile Page" hspace="200" vspace="50" width="250" height="460"></img>
		<img className="" src={App3} alt="Game Page" hspace="200" vspace="50"width="250" height="460"></img><t></t>
	    	<img className="" src={App4} alt="Game Play" hspace="200" vspace="50" width="250" height="460"></img>
                </motion.div>
            </div>
        </>
    )
}
export default About;
