import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdvancedErrorScreen extends StatelessWidget {
  final GoRouterState state;

  const AdvancedErrorScreen({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('오류 발생'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getErrorIcon(state.error),
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                _getErrorMessage(state.error),
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              Text(
                state.uri.toString(),
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go('/webtoon'),
                child: const Text('홈으로 돌아가기'),
              ),
              if (_isNotFoundError(state.error)) ...[
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _reportError(context, state.error),
                  child: const Text('오류 신고하기'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  IconData _getErrorIcon(Exception? error) {
    if (error is GoException) {
      return Icons.broken_image;
    } else if (error is StateError) {
      return Icons.error_outline;
    } else {
      return Icons.error;
    }
  }

  String _getErrorMessage(Exception? error) {
    if (error is GoException) {
      return '요청하신 페이지를 찾을 수 없습니다.';
    } else if (error is StateError) {
      return '앱 상태에 문제가 발생했습니다.';
    } else {
      return '알 수 없는 오류가 발생했습니다.';
    }
  }

  bool _isNotFoundError(Exception? error) {
    return error is GoException;
  }

  void _reportError(BuildContext context, Exception? error) {
    // 여기에 오류 보고 로직을 구현합니다.
    // 예: 서버로 오류 로그 전송, 사용자에게 피드백 요청 등
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('오류 신고'),
        content: const Text('오류가 신고되었습니다. 빠른 시일 내에 해결하겠습니다.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }
}
