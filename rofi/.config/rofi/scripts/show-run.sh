#!/bin/sh

DPI=$(xrdb -get Xft.dpi)

rofi -dpi ${DPI:-96} -show run

