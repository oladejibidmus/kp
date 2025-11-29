# Data Analytics eLearning Platform

This repository hosts a full-stack eLearning platform for data analytics, featuring dedicated portals for learners and admins.

## Tech Stack
- Frontend: React (with Tailwind CSS for styling, React Router for routing)
- Backend: Node.js, Express
- Database: PostgreSQL
- Authentication: JWT (JSON Web Tokens)

## Features
### Learner Portal
- Dashboard (course list & progress tracking)
- Course browsing (by category, difficulty)
- Course page (video, quizzes, coding exercises)
- Progress tracking (with completion %)
- Certificates (auto-generated)
- Forums (per course)
- Personal profile & history

### Admin Portal
- Analytics dashboard (engagement, charts, real-time)
- Course/lesson management (CRUD)
- Rich content editor (text, video, code)
- Quiz builder (multiple question types)
- User management (view/suspend/export)
- Certificate management (template customization)
- Forum moderation
- Report generation

## Design system
- Warm terracotta primary: rgb(168, 88, 62)
- Neutral palette: whites and grays
- Status colors: Success rgb(34, 197, 94), Error rgb(239, 68, 68), Warning rgb(245, 158, 11)
- Typography: Inter, Roboto Mono (for code)
- Border radius: 6px, 8px, 12px
- Box shadows: Ranges from subtle to elevated
- Card-based, professional and warm aesthetic

## Setup

```bash
# Backend
cd server
npm install
npm run dev

# Frontend
cd client
npm install
npm start
```