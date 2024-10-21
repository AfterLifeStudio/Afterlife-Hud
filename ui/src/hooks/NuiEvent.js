import { useEffect, useRef } from "react"
import { noop } from "@mantine/core"

export const NuiEvent = (action, handler) => {
  const savedHandler = useRef(noop)



  useEffect(() => {
    savedHandler.current = handler
  }, [handler])

  useEffect(() => {
    const eventListener = event => {
      const { action: eventAction, data } = event.data

      if (savedHandler.current) {
        if (eventAction === action) {
          savedHandler.current(data)
        }
      }
    }

    window.addEventListener("message", eventListener)
    return () => window.removeEventListener("message", eventListener)
  }, [action])
}