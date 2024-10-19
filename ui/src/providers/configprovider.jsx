import { createContext, useContext, useEffect, useState } from "react"
import { nuicallback } from "../utils/nuicallback"

const ConfigCtx = createContext(null)

const ConfigProvider = ({ children }) => {
  const [config, setConfig] = useState({})

  useEffect(() => {
    nuicallback("getConfig").then(data => setConfig(data))
  },[])

  return (
    <ConfigCtx.Provider value={{ config, setConfig }}>
      {children}
    </ConfigCtx.Provider>
  )
}

export default ConfigProvider

export const useConfig = () => useContext(ConfigCtx)
