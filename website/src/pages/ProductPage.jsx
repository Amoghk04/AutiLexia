import Logo from "../assets/logo.jpg"
import LoginPageImg from "../assets/login_page.jpg"
import WelcomePageImg from "../assets/welcome_page.jpg"
import UserProfileImg from "../assets/user_profile.jpg"
import InfoPageImg from "../assets/info_page.jpg"
import StoryLine1Img from "../assets/storyline_1.jpg"
import StoryLine2Img from "../assets/storyline_2.jpg"
import GithubImg from "../assets/github.png"
import { useState } from "react"

const ProductPage = () => {
    let [slideIndex, setSlideIndex] = useState(1);
    let sliderImgs = [
        LoginPageImg,
        WelcomePageImg,
        UserProfileImg,
        InfoPageImg,
        StoryLine1Img,
        StoryLine2Img,
    ]
    let sliderDesc = [
        "Login Page",
        "Welcome Page",
        "Profile Page",
        "Info Page",
        "Storyline-1",
        "Storyline-2",
    ]
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
                <h1>Product</h1>
            </section>


            <section className="Spectramind">
                <br />
                <h2 style={{ textAlign: "center", fontSize: "40px" }}><u>Spectramind</u></h2><br /><br />
                <p style={{ textAlign: "center", fontSize: "25px" }}>Click the icon below to download and test our product</p>
                <a href="https://github.com/sathya-pramodh/Spectramind/releases/latest" style={{ display: "flex", alignItems: "center", justifyContent: "center", scale: "45%", marginBottom: -45 }}><img src={GithubImg} /></a>
                <a href="https://github.com/sathya-pramodh/Spectramind/releases/latest" style={{ color: "black" }}><h2 style={{ textAlign: "center" }}>Github</h2></a>
                <br />
                <br />
                <br />
                <div className="product">
                    <div className="fade">
                        <div className="numbertext">{slideIndex} / 6</div>
                        <img src={sliderImgs[slideIndex - 1]} style={{ width: "100%" }} />
                        <div className="text">{sliderDesc[slideIndex - 1]}</div>
                    </div>

                    <a className="prev" onClick={() => { if (slideIndex - 1 >= 1) setSlideIndex(slideIndex - 1) }}>❮</a>
                    <a className="next" onClick={() => { if (slideIndex + 1 <= 6) setSlideIndex(slideIndex + 1); }}>❯</a>

                </div>
                <br />

                <div style={{ textAlign: "center" }}>
                    <span className="dot" onClick={() => setSlideIndex(1)}></span>
                    <span className="dot" onClick={() => setSlideIndex(2)}></span>
                    <span className="dot" onClick={() => setSlideIndex(3)}></span>
                    <span className="dot" onClick={() => setSlideIndex(4)}></span>
                    <span className="dot" onClick={() => setSlideIndex(5)}></span>
                    <span className="dot" onClick={() => setSlideIndex(6)}></span>
                </div>
            </section><br /><br />


            <section className="footer">
                <h4>About Us</h4>
                <p>We are team Binary Bandits from Ramaiah Institute of Technology</p>
            </section>
        </>
    )
}
export default ProductPage
