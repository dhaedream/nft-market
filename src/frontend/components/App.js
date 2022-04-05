import logo from "./logo.png";
import "./App.css";
import { useState } from "react";
//connects blockxhain via metamask
import { ethers } from "ethers";

function App() {
  const [account, setAccount] = useState(null);

  // MetaMask Login/Connection
  const web3Handler = async () => {
    // return array of accoints,
    // first account listed is connected
    const accounts = await window.ethereum.request({
      method: "eth_requestAccounts",
    });
    //store connected acco8nt
    setAccount(accounts[0]);
    //metamask login provider
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    // Set signer
    const signer = provider.getSigner();
  };
  return (
    <div>
      <nav className="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
        <a
          className="navbar-brand col-sm-3 col-md-2 ms-3"
          href="http://www.dappuniversity.com/bootcamp"
          target="_blank"
          rel="noopener noreferrer"
        >
          Dapp University
        </a>
      </nav>
      <div className="container-fluid mt-5">
        <div className="row">
          <main role="main" className="col-lg-12 d-flex text-center">
            <div className="content mx-auto mt-5">
              <a
                href="http://www.dappuniversity.com/bootcamp"
                target="_blank"
                rel="noopener noreferrer"
              >
                <img src={logo} className="App-logo" alt="logo" />
              </a>
              <h1 className="mt-5">Dapp University Starter Kit</h1>
              <p>
                Edit <code>src/frontend/components/App.js</code> and save to
                reload.
              </p>
              <a
                className="App-link"
                href="http://www.dappuniversity.com/bootcamp"
                target="_blank"
                rel="noopener noreferrer"
              >
                LEARN BLOCKCHAIN{" "}
                <u>
                  <b>NOW! </b>
                </u>
              </a>
            </div>
          </main>
        </div>
      </div>
    </div>
  );
}

export default App;
