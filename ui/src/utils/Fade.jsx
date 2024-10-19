import React, { useRef } from "react"
import { CSSTransition } from "react-transition-group"

const Fade = props => {
  const nodeRef = useRef(null)

  return (
    <CSSTransition
      in={props.in}
      nodeRef={nodeRef}
      classNames="transition-fade"
      timeout={200}
      unmountOnExit
    >
      <span ref={nodeRef}>{props.children}</span>
    </CSSTransition>
  )
}

export default Fade