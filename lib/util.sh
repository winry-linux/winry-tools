#!/bin/bash

#   This file is part of Winry-Tools - <http://github.com/winry-linux/winry-tools>
#
#   Copyright 2017, Joshua Strot <joshua@winrylinux.org>
#
#   Winry-Tools is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   Winry-Tools is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with Winry-Tools. If not, see <http://www.gnu.org/licenses/>.

#Create a variable for the user's home directory
load_user_info(){
    OWNER=${SUDO_USER:-$USER}

    if [[ -n $SUDO_USER ]]; then
        eval "USER_HOME=~$SUDO_USER"
    else
        USER_HOME=$HOME
    fi
}
