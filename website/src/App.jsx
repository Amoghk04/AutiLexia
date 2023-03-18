import './App.css'
import Logo from './assets/brain-logo-design-your-business-260nw-2259541317.png'

function App() {
  return (
    <>
      <div className="card">
        <img className="" src={Logo} alt="Logo" />
        <div className="card__description">
          <h1 className="heading-black">Neucare</h1>
          <ul className="card__list">
            <li className="body-light-black">Neucare is an app that is developed by four students of Ramaiah Institute of Technology.</li>
            <li className="body-light-black">It is designed to help students with autism and dyslexia learn more effectively through the use of games and interactive content.</li>
            <li className="body-light-black">You can learn more about our app and its features by exploring our website.</li>
          </ul>
        </div>
      </div>
    </>
  )
}

export default App
