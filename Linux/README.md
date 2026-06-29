# OverTheWire: Bandit — Solutions & Commands Learned

A personal record of solutions and key Linux concepts picked up while working through the [Bandit wargame](https://overthewire.org/wargames/bandit/).

---

## 🔌 Connecting

```bash
ssh bandit<LEVEL>@bandit.labs.overthewire.org -p 2220
```

---

## 📚 Levels Overview

### Level 0 → 1
**Goal:** Log in via SSH.

```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
```

---

### Level 1 → 2
**Goal:** Read a file named `-`.

**Commands learned:** `ls`, `./`

```bash
ls
cat ./-
```

> Files starting with `-` are treated as flags by the shell. Prefix with `./` to treat them as paths.

---

### Level 2 → 3
**Goal:** Read a file with spaces in its name.

**Commands learned:** `cat` with quotes

```bash
ls
cat "spaces in this filename"
```

> Wrap filenames with spaces in quotes to prevent the shell from splitting them into separate arguments.

---

### Level 3 → 4
**Goal:** Find and read a hidden file.

**Commands learned:** `ls -a`, `cat`

```bash
ls -a          # -a shows hidden files (dotfiles)
cat .hidden
```

> Files prefixed with `.` are hidden. `ls -a` reveals them.

---

### Level 4 → 5
**Goal:** Find the only human-readable file across multiple files.

**Commands learned:** `cd`, `file`, `cat`

```bash
ls
cd inhere/
file ./*       # check file types of all files
cat ./-file07  # the human-readable one
```

> `file` inspects the actual content type of a file, regardless of its name.

---

### Level 5 → 6
**Goal:** Find a file that is 1033 bytes and not executable.

**Commands learned:** `find` with `-size`, `!`, `-executable`

```bash
find . -size 1033c ! -executable
```

> `-size 1033c` = exactly 1033 bytes. `!` negates the next condition.

---

### Level 6 → 7
**Goal:** Find a file owned by user `bandit7`, group `bandit6`, and 33 bytes.

**Commands learned:** `find` with `-user`, `-group`, `2>/dev/null`

```bash
cd /
find / -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null
cat <path/to/file>
```

> `2>/dev/null` suppresses "Permission denied" errors so you can see the real result.

---

### Level 7 → 8
**Goal:** Find the password next to the word "millionth" in `data.txt`.

**Commands learned:** `grep`

```bash
grep millionth data.txt
```

> `grep <pattern> <file>` searches for a string inside a file.

---

### Level 8 → 9
**Goal:** Find the one line that appears only once in `data.txt`.

**Commands learned:** `sort`, `uniq`, `|` (pipe)

```bash
sort data.txt | uniq -u
```

> `sort` orders lines alphabetically. `uniq -u` then prints only lines that appear once. The pipe `|` passes the output of one command as input to the next.

---

### Level 9 → 10
**Goal:** Find a human-readable string preceded by `=` signs in a binary file.

**Commands learned:** `strings`, `grep`, `|`

```bash
strings data.txt | grep "=="
```

> `strings` extracts printable text from binary files. Combined with `grep`, you can filter for a specific pattern.

---

### Level 10 → 11
**Goal:** Decode a base64-encoded file.

**Commands learned:** `base64 -d`, `man`

```bash
base64 -d data.txt
```

> `man base64` opens the manual for any command. `-d` flag decodes instead of encodes.

---

### Level 11 → 12
**Goal:** Decode a ROT13-encoded file.

**Commands learned:** `tr`, `cat`, `|`

```bash
cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
```

> `tr` translates characters. ROT13 shifts each letter 13 positions — applying it twice returns the original. The pattern `'A-Za-z' 'N-ZA-Mn-za-m'` handles both cases.

---

### Level 12 → 13
**Goal:** Reverse a hex dump and decompress a repeatedly compressed file.

**Commands learned:** `mkdir`, `cp`, `xxd -r`, `mv`, `file`, `gzip`, `bzip2`, `tar`

```bash
mkdir /tmp/mydir
cp data.txt /tmp/mydir/
cd /tmp/mydir

xxd -r data.txt > data          # reverse hex dump → binary

# Repeat: check file type, rename, decompress
file data
mv data data.gz && gzip -d data.gz

file data
mv data data.bz2 && bzip2 -d data.bz2

file data
mv data data.gz && gzip -d data.gz

file data                       # POSIX tar archive
mv data data.tar && tar xf data.tar

cat <extracted file>
```

> The cycle is: `file` → rename with correct extension → decompress → repeat until you get ASCII text.

---

## ⚡ CLI Shortcuts & Productivity Tips

| Shortcut / Command | Description |
|---|---|
| `history` | Show previously run commands with numbers |
| `!<number>` | Re-run a command by its history number (e.g. `!42`) |
| `Ctrl + R` | Reverse search through command history |
| `2>/dev/null` | Suppress error output |
| `|` (pipe) | Pass stdout of one command to stdin of another |

---

## 🛠️ Commands Reference

| Command | What it does |
|---|---|
| `ssh` | Securely connect to a remote machine |
| `ls` / `ls -a` | List files / include hidden files |
| `cat` | Print file contents |
| `cd` | Change directory |
| `file` | Detect file type by content |
| `find` | Search for files by attributes |
| `grep` | Search for patterns in text |
| `sort` | Sort lines alphabetically |
| `uniq -u` | Show only unique (non-duplicate) lines |
| `strings` | Extract human-readable text from binary files |
| `tr` | Translate/replace characters |
| `base64 -d` | Decode base64-encoded data |
| `xxd -r` | Reverse a hex dump back to binary |
| `gzip -d` | Decompress `.gz` files |
| `bzip2 -d` | Decompress `.bz2` files |
| `tar xf` | Extract a tar archive |
| `mv` | Rename or move files |
| `cp` | Copy files |
| `mkdir` | Create a directory |
| `man` | Open the manual for any command |
| `history` | Show command history |
