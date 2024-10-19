import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import App from './App.jsx'
import './index.css'
import ConfigProvider from './providers/configprovider.jsx'


createRoot(document.getElementById('root')).render(
  <StrictMode>
    <ConfigProvider>
    <App />
    </ConfigProvider>
  </StrictMode>,
)
