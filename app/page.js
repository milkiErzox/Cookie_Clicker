"use client"
import { useState } from "react"

export default function Home() {
  const [cookies, setCookies] = useState(0)

  return (
    <div style={{ textAlign: "center", marginTop: "50px" }}>
      <h1>{cookies} 🍪</h1>
      <button
        onClick={() => setCookies(cookies + 1)}
        style={{
          padding: "15px 30px",
          fontSize: "20px",
          backgroundColor: "#f5a623",
          border: "none",
          borderRadius: "10px",
          cursor: "pointer",
          boxShadow: "2px 2px 5px rgba(0,0,0,0.3)"
        }}
      >
        Cliquer
      </button>
    </div>
  )
}