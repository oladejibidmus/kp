-- Users table (learner/admin)
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(10) CHECK (role IN ('learner', 'admin')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    suspended BOOLEAN DEFAULT FALSE
);

-- Courses & Lessons
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    category VARCHAR(50),
    difficulty VARCHAR(20),
    created_by INTEGER REFERENCES users(user_id)
);
CREATE TABLE lessons (
    lesson_id SERIAL PRIMARY KEY,
    course_id INTEGER REFERENCES courses(course_id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    video_url VARCHAR(500),
    order_num INTEGER
);

-- Enrollment & Progress
CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    course_id INTEGER REFERENCES courses(course_id),
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE progress (
    progress_id SERIAL PRIMARY KEY,
    enrollment_id INTEGER REFERENCES enrollments(enrollment_id) ON DELETE CASCADE,
    lesson_id INTEGER REFERENCES lessons(lesson_id) ON DELETE CASCADE,
    completed BOOLEAN DEFAULT FALSE,
    completed_at TIMESTAMP
);

-- Quizzes & Attempts
CREATE TABLE quizzes (
    quiz_id SERIAL PRIMARY KEY,
    lesson_id INTEGER REFERENCES lessons(lesson_id),
    title VARCHAR(255) NOT NULL
);
CREATE TABLE quiz_questions (
    question_id SERIAL PRIMARY KEY,
    quiz_id INTEGER REFERENCES quizzes(quiz_id),
    question_type VARCHAR(20), -- multiple choice, code, text
    question_text TEXT,
    options JSONB,
    correct_answer TEXT
);
CREATE TABLE quiz_attempts (
    attempt_id SERIAL PRIMARY KEY,
    quiz_id INTEGER REFERENCES quizzes(quiz_id),
    user_id INTEGER REFERENCES users(user_id),
    score NUMERIC,
    taken_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Certificates
CREATE TABLE certificates (
    cert_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    course_id INTEGER REFERENCES courses(course_id),
    issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    template JSONB
);

-- Forums & Posts
CREATE TABLE forums (
    forum_id SERIAL PRIMARY KEY,
    course_id INTEGER REFERENCES courses(course_id)
);
CREATE TABLE forum_posts (
    post_id SERIAL PRIMARY KEY,
    forum_id INTEGER REFERENCES forums(forum_id),
    user_id INTEGER REFERENCES users(user_id),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    parent_post_id INTEGER REFERENCES forum_posts(post_id)
);