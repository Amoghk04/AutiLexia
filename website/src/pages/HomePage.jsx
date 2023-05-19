import Logo from "../assets/logo.jpg"

const HomePage = () => {
    return <>

        <section className="header">
            <nav>
                <a href="/"><img src={Logo} /></a>
                <div className="nav-links" id="navLinks">
                    <i className="fa-solid fa-xmark"></i>
                    <ul>
                        <li><a href="/home">HOME</a></li>
                        <li><a href="/about">ABOUT</a></li>
                        <li><a href="/product">PRODUCT</a></li>
                        <li><a href="/contact-us">CONTACT US</a></li>
                    </ul>
                </div>
                <i className="fa-regular fa-bars"></i>
            </nav>
            <div className="text-box">
                <h1>The best mental healthcare app</h1>
                <p>This app has been created to make the lives of millions who suffer from various
                    autism spectrum disorders better.</p>
                <a className="hero-btn">Read on to know more</a>
            </div>
        </section>

        <section className="introHome">
            <h1>Introducing <u>Spectramind!</u></h1>
            <p>An interactive app developed by Team Binary Bandits to support people who suffer
                from mental problems and disorders like Autism and Dyslexia.</p><br /><br />
            <div className="row">
                <div className="problems-col">
                    <h3>Dyslexia</h3>
                    <p>Dyslexia is a specific learning disorder that primarily affects reading and spelling abilities. It is
                        characterized by difficulties in
                        accurately and fluently recognizing words, poor decoding skills, and challenges in phonological
                        processing. People with dyslexia may also
                        experience difficulties with writing, math, and organization skills. Dyslexia is not related to
                        intelligence, and individuals with dyslexia
                        often have strengths in other areas, such as problem-solving or creativity.</p>
                </div>

                <div className="problems-col">
                    <h3>Autism Spectrum Disorder(ASD)</h3>
                    <p>Autism Spectrum Disorder (ASD) is a developmental disorder that affects communication, social
                        interaction, and behavior. It is characterized
                        by a range of symptoms and challenges, which can vary widely from person to person. People with ASD
                        may have difficulty with social interactions,
                        exhibit repetitive behaviors, experience sensory sensitivities, and have intense interests in
                        specific topics. ASD is a lifelong condition, but early
                        intervention and appropriate support can greatly enhance an individual's quality of life and their
                        ability to navigate the world.</p>
                </div>
                <div className="problems-col">
                    <h3>Other mental health disorders</h3>
                    <p>Anxiety, insomnia, and depression are common mental disorders that affect many individuals. Anxiety
                        involves persistent feelings of fear
                        and worry, while insomnia refers to difficulty falling asleep or staying asleep. Depression, on the
                        other hand, is characterized by persistent sadness, loss of interest,
                        and feelings of worthlessness. These conditions can significantly impact daily functioning and
                        overall well-being. However, with proper support, including therapy, medication,
                        and self-care strategies, individuals can manage and overcome these challenges, leading to improved
                        mental health and quality of life.</p>
                </div>
            </div>
        </section>


        <section className="Product">
            <h1>Product</h1>
            <p>Click <a href="/product">here</a> to download our product and get fully
                benefitted by it.</p>
        </section>

        <section className="cfb">
            <h1>We are open to tie up with various organisations like hospitals, care centres and schools for the betterment
                of children and people</h1>
            <a href="/contact-us" className="hero-btn">CONTACT US</a>
        </section>


        <section className="footer">
            <h4>About Us</h4>
            <p>We are team Binary Bandits from Ramaiah Institute of Technology</p>
        </section>
    </>
}

export default HomePage
