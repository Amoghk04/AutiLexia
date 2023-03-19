import About from "./components/About"
import Features from "./components/Features"
import Authors from "./components/Authors"
import './css/App.css'

function App() {
  return (
    <>
      <div className="main__container">
        <About />
        <Features />
        <Authors />
      </div>
    </>
  )
}

export default App
