import inspect


class Pattern:
    def __init__(self, pattern, *args):
        self.pattern = pattern

    def matches(self, filename):
        raise NotImplementedError("This method should be implemented by subclasses")

    def __str__(self):
        return "".join(inspect.getsourcelines(self.matches)[0])
