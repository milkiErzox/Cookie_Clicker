"use client"   // aussi nécessaire ici si le composant utilise useState
export default function Button({ onClick, children }) {
  return <button onClick={onClick}>{children}</button>
}