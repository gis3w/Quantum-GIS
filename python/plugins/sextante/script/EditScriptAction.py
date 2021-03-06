# -*- coding: utf-8 -*-

"""
***************************************************************************
    EditScriptAction.py
    ---------------------
    Date                 : August 2012
    Copyright            : (C) 2012 by Victor Olaya
    Email                : volayaf at gmail dot com
***************************************************************************
*                                                                         *
*   This program is free software; you can redistribute it and/or modify  *
*   it under the terms of the GNU General Public License as published by  *
*   the Free Software Foundation; either version 2 of the License, or     *
*   (at your option) any later version.                                   *
*                                                                         *
***************************************************************************
"""

__author__ = 'Victor Olaya'
__date__ = 'August 2012'
__copyright__ = '(C) 2012, Victor Olaya'
# This will get replaced with a git SHA1 when you do a git archive
__revision__ = '$Format:%H$'

from sextante.script.ScriptAlgorithm import ScriptAlgorithm
from sextante.gui.ContextAction import ContextAction
from sextante.script.EditScriptDialog import EditScriptDialog

class EditScriptAction(ContextAction):

    def __init__(self):
        self.name="Edit script"

    def isEnabled(self):
        return isinstance(self.alg, ScriptAlgorithm)

    def execute(self):
        dlg = EditScriptDialog(self.alg)
        dlg.exec_()
        if dlg.update:
            self.toolbox.updateTree()