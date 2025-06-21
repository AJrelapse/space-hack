# Cargo Stowage Management System

A full-stack cargo management tool designed for efficient stowage planning and tracking aboard the International Space Station (ISS). Developed as part of a space hackathon, this system streamlines the process of allocating cargo within limited spatial constraints using a visual and data-driven approach.

## Features

- Visual 3D model of cargo space for accurate stowage representation
- Real-time addition, movement, and removal of cargo items
- Automated validation for volume and weight constraints
- Interactive UI with drag-and-drop cargo placement
- Persistent data storage and retrieval for mission continuity
- Admin panel for cargo upload, editing, and monitoring

## Tech Stack

**Frontend**
- ReactJS
- Three.js (3D Visualization)
- Tailwind CSS

**Backend**
- FastAPI (Python)
- PostgreSQL (for structured cargo data)
- RESTful API architecture

**Deployment**
- Vercel (Frontend)
- Render / Railway / Localhost (Backend)

## Installation

### Backend (FastAPI)

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/space-hack
   cd space-hack/backend
   ```

2. Create and activate a virtual environment:
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Run the API:
   ```bash
   uvicorn main:app --reload
   ```

### Frontend (React)

1. Navigate to the frontend folder:
   ```bash
   cd ../frontend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the development server:
   ```bash
   npm run dev
   ```

## Usage

- Access the 3D cargo bay visualization in the dashboard.
- Drag and drop new cargo items into the stowage layout.
- Validate placement based on size and mass.
- Save or update cargo configuration.

