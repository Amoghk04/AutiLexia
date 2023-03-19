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
                            <li className="features__card-li body-light-black">This is a point</li>
                            <li className="features__card-li body-light-black">This is a point</li>
                            <li className="features__card-li body-light-black">This is a point</li>
                        </ul>
                    </motion.div>
                    <motion.div className="features__card" whileInView={{ opacity: [0, 0.2, 0.4, 0.6, 0.8, 1] }}>
                        <ul>
                            <li className="features__card-li body-light-black">This is a point</li>
                            <li className="features__card-li body-light-black">This is a point</li>
                            <li className="features__card-li body-light-black">This is a point</li>
                        </ul>
                    </motion.div>
                </div>
            </div>
        </>
    )
}

export default Features