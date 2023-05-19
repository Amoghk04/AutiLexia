import Logo from "../assets/logo.jpg"
const ContactPage = () => {
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
                    <i className="fa-regular fa-bars"></i>
                </nav>
                <h1>Contact Us</h1>
            </section>

            <section className="contact-us">
                <div className="contact-col">
                    <div >
                        <i className="fa fa-home"></i>
                        <span >
                            <h5 >spectramindhealthcare@gmail.com</h5>
                            <p>Email us regarding business related queries and feedback</p>
                        </span>
                    </div>
                </div>
            </section>

            <section className="location">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3887.079973126632!2d77.56487369999999!3d13.030579100000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bae17dedd4dcca9%3A0x6075bd8d8aed97ab!2sRamaiah%20Institute%20of%20Technology!5e0!3m2!1sen!2sin!4v1684414776450!5m2!1sen!2sin" width="600" height="450" style={{ border: 0 }} allowFullScreen="" loading="lazy" referrerPolicy="no-referrer-when-downgrade"></iframe>
            </section>

            <section className="footer">
                <h4>About Us</h4>
                <p>We are team Binary Bandits from Ramaiah Institute of Technology</p>
            </section>
        </>
    )
}
export default ContactPage
