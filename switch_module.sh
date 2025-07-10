# Get module name
MODULE_NAME=$1

# Error without the name
if [ -z "$MODULE_NAME" ]; then
  echo "❌ Enter the module name like: ./switch_module.sh Maths101"
  exit 1
fi

# Error if no such path
MODULE_PATH="module/$MODULE_NAME"
if [ ! -d "$MODULE_PATH" ]; then
  echo "❌ Can not find the path: $MODULE_PATH"
  exit 1
fi

# Delete current files
echo "🧹 Deleting the old files..."
rm -f _quarto.yaml
rm -f *.qmd
rm -f *.png

# Copy the target module files
echo "📥 Copy $MODULE_PATH to the current project..."
cp -r $MODULE_PATH/* ./

# Compile
echo "⚙️ run quarto render..."
quarto render

echo "🌐 run quarto preview..."
quarto preview
