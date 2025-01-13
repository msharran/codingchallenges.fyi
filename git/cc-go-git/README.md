# Coding Challenge: Git

https://codingchallenges.fyi/challenges/challenge-git

This project includes implementations of git plumbing functions like `git hash-object`.

Example of `git hash-object`:

```bash
$ go run ./... hash-object
not a git repository
exit status 1

$ git init
Initialized empty Git repository in /Users/sharranm/projects/play/go-git/.git/

$ go run ./... hash-object
hash: 19102815663d23f8b75a47e7a01965dcdc96468c, content: blob 3foo
dir: .git/objects/19
file: .git/objects/19/102815663d23f8b75a47e7a01965dcdc96468c
19102815663d23f8b75a47e7a01965dcdc96468c

$ git cat-file -p 19102815663d23f8b75a47e7a01965dcdc96468c
foo⏎

# The output above would be same when we run the following
$ echo -n "foo" | git hash-object --stdin -w

# and verify using git cat-file,
$ git cat-file -p 19102815663d23f8b75a47e7a01965dcdc96468c
foo⏎
```
