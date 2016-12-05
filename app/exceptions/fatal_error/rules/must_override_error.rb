##
## if some class inheriting some interfaces doesn't override methods, this error will be thrown
##

class FatalError::Rules::MustOverrideError < StandardError
end