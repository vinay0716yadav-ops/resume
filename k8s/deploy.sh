#!/usr/bin/env bash
# ==============================================================================
# Vinay Yadav Resume & Portfolio - Kubernetes Deployment Script
# ==============================================================================

set -e

NAMESPACE="resume-system"

echo "=================================================="
echo "📄 Deploying Resume Website to Kubernetes..."
echo "=================================================="

# 1. Apply Kubernetes manifests
echo "📦 Applying K8s manifests in namespace: $NAMESPACE"
kubectl apply -k .

# 2. Wait for Application rollout
echo "⏳ Waiting for Resume App pods to be ready..."
kubectl rollout status deployment/resume-deployment -n "$NAMESPACE" --timeout=120s

echo ""
echo "=================================================="
echo "✅ Deployment Successful!"
echo "=================================================="
echo ""
echo "📊 Kubernetes Resources in '$NAMESPACE':"
kubectl get all -n "$NAMESPACE"

echo ""
echo "🌐 Accessing the Application:"
echo "--------------------------------------------------"
echo "Run this command to forward port 8080 to your local machine:"
echo "👉 kubectl port-forward svc/resume-service 8080:80 -n $NAMESPACE"
echo ""
echo "Then open in browser: http://localhost:8080"
echo "=================================================="
