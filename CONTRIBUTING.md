# Contributing to HDLOpt

We love your input! We want to make contributing to HDLOpt as easy and transparent as possible, whether it's:

- Reporting a bug
- Discussing the current state of the code
- Submitting a fix
- Proposing new features
- Implementing new HDL modules

## Development Process

We use GitHub to host code, to track issues and feature requests, as well as accept pull requests.

1. Fork the repo and create your branch from `main`
2. If you've added code that should be tested, add tests
3. If you've changed APIs, update the documentation
4. Ensure all tests pass
5. Make sure your code follows our coding standards
6. Issue a pull request

## Module Implementation Guidelines

When implementing new HDL modules:

1. Follow the template in `modules/templates/module_documentation_template.md`
2. Place Verilog implementation in the appropriate category directory under `src/`
3. Generate test files using HDLOpt's testbench generator
4. Ensure minimum 95% test pass rate
5. Include documentation following the template format
6. Submit implementation through pull request using our template

## Pull Request Process

1. Update the README.md with details of changes if applicable
2. Update the documentation with any new dependencies or setup requirements
3. Follow the pull request template
4. Get approval from at least one other developer
5. If you can't merge, request a reviewer to merge it for you

## Testing Standards

- All new modules must have testbenches
- Minimum 95% test pass rate required
- Coverage should be above 90%
- All analyses (timing, power, etc.) must pass
- Include edge case tests

## Documentation Standards

- Use clear, concise language
- Include code examples where appropriate
- Document all public interfaces
- Follow the existing documentation style
- Keep code comments up to date

## Coding Style

### Python Code
- Follow PEP 8
- Use type hints
- Include docstrings for all functions/classes
- Maximum line length of 100 characters
- Use meaningful variable names

### Verilog Code
- Use SystemVerilog-2012 features where appropriate
- Clear port and signal naming
- Include comments for complex logic
- Follow established naming conventions
- Proper indentation and formatting

## Issue Reporting

When reporting issues:

1. Use the bug report template
2. Include reproduction steps
3. List relevant environment details
4. Attach error messages/logs
5. Suggest fixes if possible

## Feature Requests

We encourage feature requests! Please:

1. Use the feature request template
2. Explain the use case
3. Provide example usage if possible
4. List potential implementation approaches

## Community and Conduct

- Follow our Code of Conduct (see CODE_OF_CONDUCT.md)
- Be respectful and constructive
- Help others when possible
- Give credit where due

## License

By contributing, you agree that your contributions will be licensed under the Apache License, Version 2.0.