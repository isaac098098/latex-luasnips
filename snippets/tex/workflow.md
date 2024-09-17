# Neovim + vimtex notes workflow

This assumes you have a generic notes folder in a convenient directory in order to access it faster. In my case, this folder is `$HOME/notes`. Use `ln -sf /long/path/to/notes/ /short/path/to/notes` to create a symbolic link, use `ln -l /path/to/folder` to check for any symbolic links and use `rm /path/to/symlink` to remove a symbolic link. *Note* that symbolic link creation acts like folder creation. Do always use absolute paths. I recommend doing this a day before starting classes. Make sure to copy `preamble.tex` and `bibliography.tex` to the physical `notes` directory, ussualy the semester directory.

## Create new notes
1. Create and enter the desired lectures folder. Create a symbolic link if necessary.
2. Enter the folder and copy the `bibliography.tex` file from the parent directory.
3. Open the main document and the first lecture. E.g. `nvim -p main.tex lec_01.tex`
4. In `main.tex`, use the `math-notes` snippet.
5. Fill the fields.
6. Save file.
7. In `lec_01.tex` use the `lec` or `les` snippets to create a new section for the lecture.
8. Fill the title field and use the `date` snippet to fill the date field.
9. Close all.
10. Open both files again.
11. Switch to `lec_1.tex`.
12. Start taking notes.

## Open existing notes
1. Enter the lectures folder.
2. Open the main document and the desired lecture.
3. In `main.tex` comment all older lectures.
4. Switch to `lec_*.tex`.
5. Compile and Start taking notes.

## Adding bibliography entries
1. Open the bibliography file. E.g. `bibliography.bib`
2. Add the BibTeX entry using snippets and fill it.
3. Go back to the lecture document and cite.
4. If there's not enough information to fill the entry, use the `foo` snippet to add a temporary footnote.

*Note:* You don't need shortcuts to automate all of the above, just do it fast. Keep it simple.
