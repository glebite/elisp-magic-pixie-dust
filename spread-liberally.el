;; spread-liberally.el

(defun kill-ring-hex-to-python-list ()
  "Obviously bind this to something.
  
  tl;dr version:
  I copy hex strings from wireshark to be used in developing python-based
  dissectors.  The strings are of the form a1b2c3d4e5f6...  I need:
  0xa1, 0xb2, 0xc3, 0xd4, 0xe5, 0xf6, ...  so I can complete things such
  as: 

  packet = [0xa1, 0xb2, 0xc3, 0xd4, 0xe5, 0xf6]

  So when I'm in emacs land, I just like to copy, yank, execute my macro
  and then move on.
  "
  (interactive)
  (setq s (car kill-ring))
  (setq counter 0)
  (while (<  counter (length s))
    (insert (format "0x%c%c, " (aref s counter) (aref s (+ 1 counter))))
    (setq counter (+ counter 2))
    )
  )

(defun double-to-single (beginning end)
  "performs regsub of double quotes to single quotes
   - probably done by another macro, but I am happy with
     this for now.  May make it detect which quotes are 
     present and force swap them - mainly for when I've dealt
     with json stuff.
  "
  (interactive "*r")
  (setq end (copy-marker end))
    (save-excursion)
    (goto-char beginning)
    (while (re-search-forward "\\(\"\\)+" nil t)
 	(replace-match "'")
 	))

(defun stub ()
  "Some stubbed-out function."
  (interactive)
  (do-some-stuff))

(defun create ()
  "Create simple test case."
  (interactive)
  (insert "def test_(<tbd>)\n")
  (insert "\t\"\"\"\n")
  (insert "\t\"\"\"\n")
  (insert "\t@<tbd>\n")
  (insert "\tdef wrapped(<tbd>)\n")
  (insert "\t\t# code goes here....\n")
  (insert "\t\treturn\n")
  (insert "\treturn wrapped()\n\n")
  )

(defun create_tcmp ()
  "Create simple test case."
  (interactive)
  (insert "def test_(ipaddr, port, platform)\n")
  (insert "\t\"\"\"\n")
  (insert "\t\"\"\"\n")
  (insert "\t@connnect.configureTCMP(impaddr, port, platform)\n")
  (insert "\tdef wrapped(tcmpMsg, tcmpResp, ....)\n")
  (insert "\t\t# code goes here....\n")
  (insert "\t\treturn\n")
  (insert "\treturn wrapped()\n\n")
  )

(defun create_console ()
  "Create simple test case."
  (interactive)
  (insert "def test_(piipaddr, port, platform)\n")
  (insert "\t\"\"\"\n")
  (insert "\t\"\"\"\n")
  (insert "\t@console.configureConsole(piipaddr, port, platform)\n")
  (insert "\tdef wrapped(conn)\n")
  (insert "\t\t# code goes here....\n")
  (insert "\t\treturn\n")
  (insert "\treturn wrapped()\n\n")
  )
