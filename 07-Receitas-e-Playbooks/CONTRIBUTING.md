# Contributing to OrbitBM 🚀

Thank you for your interest in contributing to OrbitBM! This document provides guidelines and information for contributors.

## Code of Conduct 📜

By participating in this project, you agree to abide by our Code of Conduct:

- Be respectful and inclusive
- Welcome newcomers and help them get started
- Focus on constructive criticism
- Respect different viewpoints and experiences
- Show empathy towards other community members

## How to Contribute 🤝

### Reporting Issues 🐛

1. **Search existing issues** first to avoid duplicates
2. **Use issue templates** when available
3. **Provide detailed information**:
   - Steps to reproduce
   - Expected vs actual behavior
   - Environment details (OS, browser, versions)
   - Screenshots or logs if applicable

### Suggesting Features 💡

1. **Check existing issues** and **roadmap** first
2. **Explain the use case** and **why it's needed**
3. **Describe the proposed solution**
4. **Consider alternatives** you've thought about
5. **Be open to discussion** and feedback

### Pull Requests 📝

#### Before You Start

1. **Fork the repository** and **create a branch**:
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/issue-description
   ```

2. **Follow branch naming conventions**:
   - `feature/add-user-profiles`
   - `fix/memory-leak-in-chat`
   - `docs/update-api-documentation`
   - `refactor/optimize-payment-processing`

3. **Set up your development environment**:
   ```bash
   # Install dependencies
   npm install
   
   # Run tests to ensure everything works
   npm test
   
   # Start development server
   npm run dev
   ```

#### Development Guidelines

##### Code Style 🎨

- **Use TypeScript** for all new code
- **Follow ESLint configuration** in the project
- **Use Prettier** for code formatting
- **Write meaningful variable and function names**
- **Add JSDoc comments** for public APIs

```typescript
// Good
export class UserService {
  /**
   * Creates a new user account
   * @param createUserDto - User creation data
   * @returns Created user with generated ID
   * @throws ConflictException if email already exists
   */
  async createUser(createUserDto: CreateUserDto): Promise<User> {
    const existingUser = await this.findByEmail(createUserDto.email);
    if (existingUser) {
      throw new ConflictException('Email already registered');
    }
    
    return this.userRepository.create(createUserDto);
  }
}

// Bad
export class UserSvc {
  async create(dto: any): Promise<any> {
    const u = await this.find(dto.email);
    if (u) throw new Error('exists');
    return this.repo.create(dto);
  }
}
```

##### Component Structure 🏗️

- **Keep components small** and focused
- **Use composition over inheritance**
- **Follow single responsibility principle**
- **Extract reusable logic into custom hooks**

```typescript
// Component structure example
export function UserProfile({ userId }: { userId: string }) {
  const { user, loading, error } = useUser(userId);
  const { updateProfile } = useUpdateProfile();
  
  if (loading) return <LoadingSpinner />;
  if (error) return <ErrorMessage error={error} />;
  if (!user) return <NotFound />;
  
  return (
    <div className="user-profile">
      <UserHeader user={user} />
      <UserDetails user={user} />
      <UserActions 
        user={user} 
        onUpdate={updateProfile}
      />
    </div>
  );
}
```

##### Testing 🧪

- **Write tests for all new features**
- **Maintain test coverage above 80%**
- **Use descriptive test names**
- **Test edge cases and error scenarios**

```typescript
describe('UserService', () => {
  describe('createUser', () => {
    it('should create user with valid data', async () => {
      const userData = {
        email: 'test@example.com',
        name: 'Test User'
      };
      
      const user = await userService.createUser(userData);
      
      expect(user).toBeDefined();
      expect(user.email).toBe(userData.email);
      expect(user.name).toBe(userData.name);
      expect(user.id).toBeDefined();
    });
    
    it('should throw ConflictException for duplicate email', async () => {
      const existingUser = await userService.createUser({
        email: 'existing@example.com',
        name: 'Existing User'
      });
      
      await expect(
        userService.createUser({
          email: existingUser.email,
          name: 'New User'
        })
      ).rejects.toThrow(ConflictException);
    });
  });
});
```

##### Documentation 📚

- **Update README** if you change setup instructions
- **Document new APIs** in OpenAPI/Swagger format
- **Add inline comments** for complex logic
- **Update wiki** or documentation site

#### Commit Guidelines

##### Commit Message Format

```
type(scope): description

[optional body]

[optional footer]
```

##### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

##### Examples

```bash
# Good commits
git commit -m "feat(auth): add OAuth2 integration with Google"

git commit -m "fix(payments): resolve memory leak in payment processing

The payment service was not properly cleaning up event listeners,
causing memory usage to grow continuously.

Fixes #123"

git commit -m "docs(api): update OpenAPI specification for user endpoints

- Add new fields to User schema
- Document pagination parameters
- Add response examples"

# Bad commits
git commit -m "fix stuff"
git commit -m "changes"
git commit -m "update code"
```

#### Pull Request Process 🔄

1. **Update your branch** with the latest main branch:
   ```bash
   git fetch origin
   git rebase origin/main
   ```

2. **Run all tests** and ensure they pass:
   ```bash
   npm test
   npm run test:integration
   npm run lint
   npm run type-check
   ```

3. **Create a pull request** with:
   - **Clear title** and **description**
   - **Link to related issues**
   - **Screenshots** if UI changes
   - **Test results** and **coverage reports**

4. **Request reviews** from maintainers

5. **Address feedback** promptly and professionally

6. **Squash commits** if requested:
   ```bash
   git rebase -i main
   git push --force-with-lease
   ```

### Review Process 👀

#### For Reviewers

- **Be constructive** and **specific** in feedback
- **Test the changes** locally when possible
- **Consider performance** and **security** implications
- **Check documentation** updates
- **Verify tests** are comprehensive

#### For Contributors

- **Respond to feedback** promptly
- **Ask for clarification** if needed
- **Make requested changes** in new commits
- **Update PR description** if scope changes
- **Be patient** - reviews take time

## Development Setup 🛠️

### Prerequisites

- Node.js 18+ and npm
- Docker and Docker Compose
- Git
- Code editor (VS Code recommended)

### Environment Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/orbitbm/orbitbm.git
   cd orbitbm
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Set up environment variables**:
   ```bash
   cp .env.example .env
   # Edit .env with your configurations
   ```

4. **Start development environment**:
   ```bash
   # Start all services
   npm run dev
   
   # Or start specific services
   npm run dev:api
   npm run dev:web
   npm run dev:workers
   ```

### Project Structure 📁

```
orbitbm/
├── src/
│   ├── api/           # Backend API (NestJS)
│   ├── web/           # Frontend web app (Next.js)
│   ├── mobile/        # Mobile app (React Native)
│   ├── shared/        # Shared types and utilities
│   └── workers/       # Background workers
├── docs/              # Documentation
├── scripts/           # Build and utility scripts
└── tests/             # End-to-end tests
```

## Release Process 🚀

### Version Numbering

We follow [Semantic Versioning](https://semver.org/):
- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

### Release Steps

1. **Update version** in package.json
2. **Update CHANGELOG.md** with new features and fixes
3. **Create release tag**:
   ```bash
   git tag -a v1.2.3 -m "Release version 1.2.3"
   git push origin v1.2.3
   ```
4. **Create GitHub release** with release notes

## Community and Support 💬

### Communication Channels

- **GitHub Issues**: Bug reports and feature requests
- **GitHub Discussions**: Questions and general discussion
- **Discord**: Real-time chat and support
- **Email**: security@orbitbm.com (security issues only)

### Getting Help

1. **Check documentation** first
2. **Search existing issues**
3. **Ask in Discord** for quick questions
4. **Create an issue** for bugs or feature requests

## Recognition 🏆

Contributors are recognized in:
- **README.md** contributors section
- **Release notes** for significant contributions
- **Annual contributor awards**
- **Hall of fame** page on our website

## License 📄

By contributing to OrbitBM, you agree that your contributions will be licensed under the same license as the project (MIT License).

---

**Thank you for contributing to OrbitBM! 🎉**

For questions about contributing, feel free to reach out to the maintainers or ask in our community channels.