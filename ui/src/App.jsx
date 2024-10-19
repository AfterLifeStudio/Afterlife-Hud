import { useState } from 'react'
import './App.css'
import Hud from './components/Hud'
import { createTheme, MantineProvider } from '@mantine/core';
import {emotionTransform, MantineEmotionProvider,} from '@mantine/emotion';

import { useConfig } from './providers/configprovider';

const theme = createTheme({
  primary: 'blue'
});

function App() {

  const { config } = useConfig();

  return (
    <>

    <MantineProvider theme={{...theme , ...config.theme}}>
      <MantineEmotionProvider>
        <Hud />
        </MantineEmotionProvider>
    </MantineProvider>
    </>
  )
}

export default App
