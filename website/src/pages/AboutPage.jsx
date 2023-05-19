import Logo from "../assets/logo.jpg"
import AbhayImg from "../assets/abhay.png"
import AmoghImg from "../assets/amogh.png"
import SathyaImg from "../assets/sathya.png"
import JaswantImg from "../assets/jaswanth.png"

const AboutPage = () => {
    return (
        <>
            <section className="sub-header">
                <nav>
                    <a href="/"><img src={Logo} /></a>
                    <div className="nav-links" id="navLinks">
                        <i className="fa-solid fa-xmark" ></i>
                        <ul>
                            <li><a href="/">HOME</a></li>
                            <li><a href="/about">ABOUT</a></li>
                            <li><a href="/product">PRODUCT</a></li>
                            <li><a href="/contact-us">CONTACT US</a></li>
                        </ul>
                    </div>
                    <i className="fa-regular fa-bars" ></i>
                </nav>
                <h1>About Us</h1>
            </section>


            <section className="about-us">
                <div className="row">
                    <div className="about-col">
                        <h1>We are Spectramind</h1>
                        <p>Spectramind was an app built for the Geeks for Geeks Solving for India Hackathon
                            by the team Binary Bandits from Ramaiah Institute of Technology, Bangalore. It is an
                            app that aims to provide a better life and stabilise mental health disorders in people, mainly
                            Dyslexia and ASD. </p>
                    </div>
                    <div className="about-col">
                        <img />
                    </div>
                </div>
            </section>


            <div className="wrapper">
                <h1>Our Team</h1>
                <div className="our_team">
                    <div className="team_member">
                        <div className="member_img">
                            <img src={AbhayImg} alt="our_team" />
                        </div>
                        <h3>Abhay Bhandarkar</h3>
                        <span>Team Lead</span>
                        <p>Developer of this website, machine learning enthusiast, aspiring fullstack developer</p>
                    </div>
                    <div className="team_member">
                        <div className="member_img">
                            <img src={AmoghImg} alt="our_team" />
                        </div>
                        <h3>Amogh Kalasapura</h3>
                        <span>Fullstack developer</span>
                        <p>Skilled in Python for Competitive programming, Flutter developer</p>
                    </div>
                    <div className="team_member">
                        <div className="member_img">
                            <img src={SathyaImg} alt="our_team" />
                        </div>
                        <h3>Sathya Pramodh</h3>
                        <span>Fullstack Developer</span>
                        <p>Active in Open source contribution, skilled in C++ for competitive programming, Flutter developer</p>
                    </div>
                    <div className="team_member">
                        <div className="member_img">
                            <img src={JaswantImg} alt="our_team" />
                        </div>
                        <h3>Jaswant</h3>
                        <span>Android developer</span>
                        <p>Skilled in Java programming, aspiring android developer</p>
                    </div>
                </div>
            </div>
            <section className="footer">
                <h4>About Us</h4>
                <p>We are team Binary Bandits from Ramaiah Institute of Technology</p>
            </section>
        </>
    )
}
export default AboutPage
