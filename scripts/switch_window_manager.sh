#!/bin/bash

# Bidirectional script to toggle between Rectangle and AeroSpace

echo "🔄 Checking current window manager status..."

# Check what's currently running
RECTANGLE_RUNNING=$(pgrep -i rectangle)
AEROSPACE_RUNNING=$(pgrep -i aerospace)

if [ -n "$RECTANGLE_RUNNING" ] && [ -n "$AEROSPACE_RUNNING" ]; then
  echo "⚠️  Both Rectangle and AeroSpace are running!"
  echo "🛑 Killing both to clean up..."
  pkill -i rectangle
  pkill -i aerospace
  sleep 2
  echo "✅ Both processes stopped. Run script again to start Rectangle."
  exit 0
fi

if [ -n "$RECTANGLE_RUNNING" ]; then
  echo "📦 Rectangle is currently running"
  echo "🛑 Stopping Rectangle..."

  if pkill -i rectangle; then
    echo "✅ Rectangle stopped"
    sleep 1
  else
    echo "⚠️  Force killing Rectangle..."
    pkill -9 -i rectangle
    sleep 2
  fi

  echo "🚀 Starting AeroSpace..."
  if [ -d "/Applications/AeroSpace.app" ]; then
    open -a AeroSpace
    sleep 2
    if pgrep -i aerospace >/dev/null; then
      echo "✅ Switched to AeroSpace"
      osascript -e 'display notification "Switched to AeroSpace" with title "Window Manager Toggle"' 2>/dev/null
    else
      echo "❌ Failed to start AeroSpace"
    fi
  else
    echo "❌ AeroSpace not found in /Applications/"
  fi

elif [ -n "$AEROSPACE_RUNNING" ]; then
  echo "🛩️  AeroSpace is currently running"
  echo "🛑 Stopping AeroSpace..."

  if pkill -i aerospace; then
    echo "✅ AeroSpace stopped"
    sleep 1
  else
    echo "⚠️  Force killing AeroSpace..."
    pkill -9 -i aerospace
    sleep 2
  fi

  echo "🚀 Starting Rectangle..."
  if [ -d "/Applications/Rectangle.app" ]; then
    open -a Rectangle
    sleep 2
    if pgrep -i rectangle >/dev/null; then
      echo "✅ Switched to Rectangle"
      osascript -e 'display notification "Switched to Rectangle" with title "Window Manager Toggle"' 2>/dev/null
    else
      echo "❌ Failed to start Rectangle"
    fi
  else
    echo "❌ Rectangle not found in /Applications/"
  fi

else
  echo "🔍 Neither Rectangle nor AeroSpace is running"
  echo "🚀 Starting Rectangle (default choice)..."

  if [ -d "/Applications/Rectangle.app" ]; then
    open -a Rectangle
    sleep 2
    if pgrep -i rectangle >/dev/null; then
      echo "✅ Rectangle started"
      osascript -e 'display notification "Started Rectangle" with title "Window Manager Toggle"' 2>/dev/null
    else
      echo "❌ Failed to start Rectangle"
    fi
  else
    echo "❌ Rectangle not found in /Applications/"
    echo "🚀 Trying AeroSpace instead..."
    if [ -d "/Applications/AeroSpace.app" ]; then
      open -a AeroSpace
      echo "✅ AeroSpace started"
      osascript -e 'display notification "Started AeroSpace" with title "Window Manager Toggle"' 2>/dev/null
    fi
  fi
fi

echo ""
echo "📊 Current status:"
if pgrep -i rectangle >/dev/null; then
  echo "✅ Rectangle: Running"
else
  echo "❌ Rectangle: Not running"
fi

if pgrep -i aerospace >/dev/null; then
  echo "✅ AeroSpace: Running"
else
  echo "❌ AeroSpace: Not running"
fi

osascript -e 'display notification "Switched to AeroSpace" with title "Window Manager"'
