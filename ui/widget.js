;(function () {
  const tips = [
    'Stay hydrated.',
    'Check your map.',
    'Drive safe.',
    'Call a friend.',
    'Park legally.',
    'Wear a helmet.'
  ]

  const tipEl = document.getElementById('tip')
  const clockEl = document.getElementById('clock')
  const sizeEl = document.getElementById('sizeLabel')
  const editHint = document.getElementById('editHint')
  const root = document.getElementById('root')

  function pickTip() {
    tipEl.textContent = tips[Math.floor(Math.random() * tips.length)]
  }

  function tick() {
    const now = new Date()
    const h = String(now.getHours()).padStart(2, '0')
    const m = String(now.getMinutes()).padStart(2, '0')
    clockEl.textContent = h + ':' + m
  }

  function setEditing(editing) {
    const on = editing === true
    root.classList.toggle('is-editing', on)
    editHint.hidden = !on
  }

  function onMessage(event) {
    const data = event.data
    if (!data || typeof data !== 'object') return

    if (data.type === 'gksphone:widget:init') {
      if (data.size) sizeEl.textContent = String(data.size).replace('x', '×')
      setEditing(data.editing)
      return
    }

    if (data.type === 'gksphone:widget:editing') {
      setEditing(data.editing)
    }
  }

  window.addEventListener('message', onMessage)
  pickTip()
  tick()
  setInterval(tick, 15000)
  setInterval(pickTip, 20000)
})()
