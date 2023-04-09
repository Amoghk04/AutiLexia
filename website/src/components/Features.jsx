import '../css/Features.css'
import { motion } from 'framer-motion'

const Features = () => {
    return (
        <>
            <div className="features__container">
                <h1 className="features__title">Some cool things we do!</h1>
                <p className="body-light-black features__tagline">...cool things! YAY!</p>
                <div className="features__card-container">
                    <motion.div className="features__card" whileInView={{ opacity: [0, 0.2, 0.4, 0.6, 0.8, 1] }}>
                        <ul>
                            <li className="features__card-li body-light-black">Two new Exciting storylines!!!</li>
                            <li className="features__card-li body-light-black">Multiple Pets like Uni and Phoenix to choose from!!!</li>
                            <li className="features__card-li body-light-black">Interactive Storylines to engage with!!</li>
                        </ul>
                    </motion.div>
                    <motion.div className="features__card" whileInView={{ opacity: [0, 0.2, 0.4, 0.6, 0.8, 1] }}>
                        <ul>
                            <li className="features__card-li body-light-black">Earn tokens as you progress🪙</li>
                            <li className="features__card-li body-light-black">Learn about people suffering from these diseases😔😔</li>
                            <li className="features__card-li body-light-black">Daily Challenges which test your reasoning and mental abilities!!!</li>
                        </ul>
                    </motion.div>
                </div>
            </div>
        </>
    )
}

export default Features
