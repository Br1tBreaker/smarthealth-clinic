#!/bin/bash
#===============================================================================
# SmartHealth Clinic - Auto Deploy Script
# Version: 2.0
# Deploy to Vercel, Netlify, or GitHub Pages
#===============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_NAME="smarthealth-clinic"

echo "═══════════════════════════════════════════════════════════"
echo "🏥 SmartHealth Clinic - Deployment Script"
echo "═══════════════════════════════════════════════════════════"
echo ""

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "📦 Initializing Git repository..."
    git init
    git add .
    git commit -m "Initial commit - SmartHealth Clinic AI 2.0"
fi

# Option 1: GitHub + Vercel (Recommended)
echo ""
echo "🚀 DEPLOYMENT OPTIONS:"
echo ""
echo "1️⃣  Vercel (Recommended - FREE, Auto-deploy)"
echo "2️⃣  Netlify (FREE, Drag & Drop)"
echo "3️⃣  GitHub Pages (FREE, Static hosting)"
echo "4️⃣  Manual (Download & upload)"
echo ""
read -p "Choose deployment method (1-4): " choice

case $choice in
    1)
        echo ""
        echo "📤 Pushing to GitHub..."
        git remote remove origin 2>/dev/null || true
        read -p "Enter GitHub username: " gh_user
        git remote add origin https://github.com/${gh_user}/${APP_NAME}.git
        git push -u origin master
        
        echo ""
        echo "✅ GitHub repository created!"
        echo ""
        echo "🔗 Next steps:"
        echo "1. Go to https://vercel.com/new"
        echo "2. Import repository: ${gh_user}/${APP_NAME}"
        echo "3. Click Deploy"
        echo "4. Get your FREE live URL!"
        echo ""
        ;;
    2)
        echo ""
        echo "📦 Creating deployment package..."
        zip -r ${APP_NAME}-deploy.zip index.html manifest.json sw.js vercel.json README.md
        
        echo ""
        echo "✅ Package created: ${APP_NAME}-deploy.zip"
        echo ""
        echo "🔗 Next steps:"
        echo "1. Go to https://netlify.com/drop"
        echo "2. Drag and drop the zip file"
        echo "3. Get your FREE live URL!"
        echo ""
        ;;
    3)
        echo ""
        echo "📄 Setting up GitHub Pages..."
        
        # Create gh-pages branch
        git checkout --orphan gh-pages
        git reset --hard
        cp index.html manifest.json sw.js vercel.json README.md .
        git add .
        git commit -m "Deploy to GitHub Pages"
        
        echo ""
        echo "✅ Pushing to GitHub..."
        git remote remove origin 2>/dev/null || true
        read -p "Enter GitHub username: " gh_user
        git remote add origin https://github.com/${gh_user}/${APP_NAME}.git
        git push -u origin gh-pages --force
        
        echo ""
        echo "🔗 Your app will be live at:"
        echo "https://${gh_user}.github.io/${APP_NAME}/"
        echo ""
        echo "⚠️  Enable GitHub Pages:"
        echo "1. Go to https://github.com/${gh_user}/${APP_NAME}/settings/pages"
        echo "2. Select Branch: gh-pages"
        echo "3. Click Save"
        echo ""
        ;;
    4)
        echo ""
        echo "📦 Creating manual deployment package..."
        zip -r ${APP_NAME}-manual.zip index.html manifest.json sw.js vercel.json README.md
        
        echo ""
        echo "✅ Package created: ${APP_NAME}-manual.zip"
        echo ""
        echo "🔗 Upload to any hosting:"
        echo "- Vercel: https://vercel.com/new"
        echo "- Netlify: https://netlify.com/drop"
        echo "- GitHub Pages: Upload files manually"
        echo "- Firebase: https://firebase.google.com/hosting"
        echo ""
        ;;
    *)
        echo "❌ Invalid choice"
        exit 1
        ;;
esac

echo "═══════════════════════════════════════════════════════════"
echo "✅ DEPLOYMENT READY!"
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "📱 App Features:"
echo "✓ AI Symptom Checker"
echo "✓ Doctor Booking System"
echo "✓ Health Tips Generator"
echo "✓ PWA Installable"
echo "✓ Offline Support"
echo "✓ Mobile Responsive"
echo ""
echo "💰 Cost: \$0 USD (FREE hosting)"
echo ""
