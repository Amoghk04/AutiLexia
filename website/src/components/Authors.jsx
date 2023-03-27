import { motion } from 'framer-motion'
import '../css/Authors.css'

const Authors = () => {
    return (
        <>
            <div className="authors__container">
                <h1 className="authors__title">People who made this possible</h1>
                <div className="authors__card-container">
                    <motion.div className="authors__card" whileInView={{ x: [-100, -95, -90, -85, -80, -75, -70, -65, -60, -55, -50, -45, -40, -35, -30, -25, -20, -15, -10, -5, 0], opacity: [0, 0.2, 0.4, 0.6, 0.8, 1] }}>
                        <h1 className="heading-black">Sathya Pramodh</h1>
                        <ul>
                            <li className="authors__description body-light-black">Very cool dude (not self proclaimed 😉). </li>
                            <li className="authors__description body-light-black">Responsible for the website UI design and development.</li>
                        </ul>
                    </motion.div>

                    <motion.div className="authors__card" whileInView={{ x: [-100, -95, -90, -85, -80, -75, -70, -65, -60, -55, -50, -45, -40, -35, -30, -25, -20, -15, -10, -5, 0], opacity: [0, 0.2, 0.4, 0.6, 0.8, 1], }}>
                        <h1 className="heading-black">Abhay Bhandarkar</h1>
                        <ul>
                            <li className="authors__description body-light-black">Team lead</li>
                            <li className="authors__description body-light-black">Machine learning and Deep learning enthusiast🤖, Flutter developer👨‍💻</li>
                        </ul>
                    </motion.div>

                    <motion.div className="authors__card" whileInView={{ x: [-100, -95, -90, -85, -80, -75, -70, -65, -60, -55, -50, -45, -40, -35, -30, -25, -20, -15, -10, -5, 0], opacity: [0, 0.2, 0.4, 0.6, 0.8, 1], }}>
                        <h1 className="heading-black">Amogh Kalasapura</h1>
                        <ul>
                            <li className="authors__description body-light-black">Content creator and backend/UI designer for the app 🤡</li>
                            <li className="authors__description body-light-black">Also the person who gets rickrolled the most 🤪🤪</li>
                        </ul>
                    </motion.div>

                    <motion.div className="authors__card" whileInView={{ x: [-100, -95, -90, -85, -80, -75, -70, -65, -60, -55, -50, -45, -40, -35, -30, -25, -20, -15, -10, -5, 0], opacity: [0, 0.2, 0.4, 0.6, 0.8, 1], }}>
                        <h1 className="heading-black body-light-black">Gagan P</h1>
                        <ul>
                            <li className="authors__description body-light-black">Fullstack developer😎,AIML🤖</li>
                        </ul>
                    </motion.div>
                </div>

            </div>
        </>
    )
}


export default Authors