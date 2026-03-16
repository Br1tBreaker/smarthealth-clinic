#!/bin/bash
# Deploy SmartHealth Clinic to GitHub + Vercel

cd /root/Zay/agents/automation/zero-cost-app-factory/generated-apps/smarthealth-clinic

echo "🚀 Deploying SmartHealth Clinic..."

# Initialize git
git init
git add .
git commit -m "SmartHealth Clinic - AI Healthcare App"

# Create GitHub repo
gh repo create smarthealth-clinic --public --source=. --push

echo "✅ GitHub deployed!"
echo "📂 https://github.com/khinesandyhtun-hash/smarthealth-clinic"

# Deploy to Vercel
vercel --prod

echo "✅ Vercel deployed!"
echo "🌐 Live URL will be: https://smarthealth-clinic.vercel.app"
