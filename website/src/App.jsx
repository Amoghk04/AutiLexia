import About from "./components/About"
import Features from "./components/Features"
import Authors from "./components/Authors"
import Snaps from "./components/Snaps.jsx"
import './css/App.css'

function App() {
    return (
        <>
            <div className="main__container">
                <About />
                <Snaps />
                <Features />
                <Authors />
            </div>
        </>
    )
}

export default App
